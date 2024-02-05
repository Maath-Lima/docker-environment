FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

RUN dotnet dev-certs https

WORKDIR /src

COPY ["Docker.Environment.Consumer.API/*.csproj", "Docker.Environment.Consumer.API/"]
COPY ["Docker.Environment.Data.Database/*.csproj", "Docker.Environment.Data.Database/"]
COPY ["Docker.Environment.Data.Models/*.csproj", "Docker.Environment.Data.Models/"]
RUN --mount=type=cache,id=nuget,target=/root/.nuget/packages \
	dotnet restore "Docker.Environment.Consumer.API/Docker.Environment.Consumer.API.csproj"

COPY . .

WORKDIR "/src/Docker.Environment.Consumer.API"
RUN --mount=type=cache,id=nuget,target=/root/.nuget/packages \
	dotnet build "Docker.Environment.Consumer.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Docker.Environment.Consumer.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Docker.Environment.Consumer.API.dll"]