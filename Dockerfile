# Projeyi derlemek için .NET SDK imajını kullan
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Proje dosyalarını kopyala ve geri yükle
COPY *.csproj ./
RUN dotnet restore

# Tüm dosyaları kopyala ve yayınla
COPY . ./
RUN dotnet publish -c Release -o out

# Çalışma zamanı imajını kullan
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out .

# Uygulamayı başlat
ENTRYPOINT ["dotnet", "TaskFlow.dll"]