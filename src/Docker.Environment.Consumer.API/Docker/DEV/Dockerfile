FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

RUN dotnet dev-certs https

WORKDIR /src

COPY Docker.Environment.Consumer.API/Docker.Environment.Consumer.API.csproj .
COPY Docker.Environment.Data.Database/Docker.Environment.Data.Database.csproj .
COPY Docker.Environment.Data.Models/Docker.Environment.Data.Models.csproj .

RUN dotnet restore "Docker.Environment.Consumer.API.csproj"

COPY . .

CMD ["dotnet", "watch", "run", "--environment=Docker", "--project" , "Docker.Environment.Consumer.API/Docker.Environment.Consumer.API.csproj",  "--urls", "https://*:443;http://*:80"]