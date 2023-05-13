.PHONY: reset-docker

NAME = ft_onion

all:
	@docker build -t $(NAME) .
	@docker run -p 80:80 -p 4242:22 --name $(NAME) -d $(NAME)
	@echo "Password:"
	@docker exec -it ft_onion cat pass.txt

reset:
	@echo "Deteniendo y eliminando contenedores..."
	@docker stop $$(docker ps -aq) 2>/dev/null || true
	@docker rm $$(docker ps -aq) 2>/dev/null || true
	@echo "Eliminando imágenes..."
	@docker rmi $$(docker images -aq) 2>/dev/null || true
	@echo "Eliminando volúmenes..."
	@docker volume prune -f
	@echo "Reset de Docker completado"

in: all
	docker exec -ti ft_onion /bin/sh

rerun:
	@docker stop $(NAME)
	@docker rm $(NAME)
	@docker build -t $(NAME) .
	@docker run -p 80:80 -p 4242:22 --name $(NAME) -d $(NAME)

re: reset all
