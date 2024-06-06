# Utiliza una imagen base de Node.js 20.11.0
FROM node:20.11.0

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el archivo package.json y package-lock.json en el contenedor
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de los archivos de la aplicación en el contenedor
COPY . .

# Expone el puerto en el que correrá la aplicación
EXPOSE 3000

# Define el comando por defecto para correr la aplicación
CMD ["npm", "start"]
