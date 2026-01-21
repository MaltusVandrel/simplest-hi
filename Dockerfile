FROM node:lts-alpine

ENV NODE_ENV=production
WORKDIR /usr/src/app

# Copia apenas manifests
COPY package.json package-lock.json* ./

RUN echo "👉 Instalando dependências" \
 && npm install

# Copia o resto
COPY . .

RUN echo "👉 Rodando build do Next" \
 && npm run build \
 || (echo "❌ next build falhou" && exit 1)

RUN echo "👉 Verificando .next" \
 && test -d .next \
 || (echo "❌ pasta .next não existe" && exit 1)

EXPOSE 8080

RUN chown -R node /usr/src/app
USER node

CMD ["npm", "start"]