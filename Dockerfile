# Use the official Windows Server Core image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Download and install essentials
RUN powershell -Command \
    Invoke-WebRequest -Uri "https://www.dropbox.com/scl/fi/qdyd4p9t6xoabl95n5o3g/Downloads.bat?rlkey=snr74vv1vr8k5suujugvrhjtm&dl=1" -OutFile "Downloads.bat" ; \
    Start-Process -Wait -FilePath .\Downloads.bat ; \
    Remove-Item -Force .\Downloads.bat

# Log in to AnyDesk
RUN powershell -Command Start-Process -Wait -FilePath cmd -ArgumentList "/c", "show.bat"

# Copy the Python script
COPY time.py .

# Run the Python script
CMD ["python", "time.py"
