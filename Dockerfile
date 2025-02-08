# Basis-Image
FROM node:18

# Arbeitsverzeichnis setzen
WORKDIR /App

# Abhängigkeiten kopieren und installieren
COPY package.json ./
RUN npm install

# App-Code kopieren
COPY . .

# Port freigeben
EXPOSE 3000

# Start-Befehl
CMD ["node", "app.js"]
