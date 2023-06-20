FROM mcr.microsoft.com/powershell

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install Chocolatey
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install MSBuild
# RUN choco install microsoft-build-tools --version 14.0.25420.1 -y

# Install nuget
RUN choco install nuget.commandline -y

# Add NuGet to PATH
RUN $env:Path = 'C:\Program Files (x86)\NuGet;' + $env:Path; [Environment]::SetEnvironmentVariable('Path', $env:Path, [EnvironmentVariableTarget]::Machine)

# Copy msbuild
COPY MSBuild C:\"Program Files (x86)"\

# Add MSBuild to PATH
RUN $env:Path = 'C:\Program Files (x86)\MSBuild\14.0\Bin;' + $env:Path; [Environment]::SetEnvironmentVariable('Path', $env:Path, [EnvironmentVariableTarget]::Machine)
