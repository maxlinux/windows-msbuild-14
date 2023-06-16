FROM mcr.microsoft.com/powershell

# Install Chocolatey

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install MSBuild
RUN choco install microsoft-build-tools --version 14.0.25420.1 -y

# Add MSBuild to PATH
RUN $env:Path = 'C:\Program Files (x86)\MSBuild\14.0\Bin;' + $env:Path; [Environment]::SetEnvironmentVariable('Path', $env:Path, [EnvironmentVariableTarget]::Machine)

CMD [ "pwsh" ]
