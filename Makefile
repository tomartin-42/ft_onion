.PHONY: reset-docker

NAME = ft_onion

all:
	@docker build -t $(NAME) .
	@docker run -p 80:80 --name $(NAME) -d $(NAME)

reset:
	@echo "Deteniendo y eliminando contenedores..."
	@docker stop $$(docker ps -aq) 2>/dev/null || true
	@docker rm $$(docker ps -aq) 2>/dev/null || true
	@echo "Eliminando imágenes..."
	@docker rmi $$(docker images -aq) 2>/dev/null || true
	@echo "Eliminando volúmenes..."
	@docker volume prune -f
	@echo "Reset de Docker completado"

