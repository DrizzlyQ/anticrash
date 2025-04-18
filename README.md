🚨 Anti-Crash Detector for QBCore FiveM Servers
📖 Overview
The Anti-Crash Detector is a powerful script designed for QBCore-based FiveM servers to detect and prevent crash exploits. It actively monitors player activity to detect suspicious behaviors like entity spawn abuse, invalid model hashes, and force exploitations. Upon detection, it sends an informative and styled alert to your Discord channel.

⚙️ Features
🚧 Entity Spawn Abuse Detection: Tracks excessive spawn rates of peds, vehicles, and objects.

🔒 Model Hash Validation: Ensures that players are using only valid, in-game models.

💥 Force Exploit Detection: Detects abnormal use of in-game forces, such as pushing entities with extreme force.

📱 Discord Webhook Alerts: Sends beautifully styled alerts to your Discord with detailed detection information and optional screenshots.

🔧 Fully Configurable: Set spawn limits, time windows, and debug options to match your server’s needs.

🛠️ Installation & Setup
1. Clone the Repository
You can either download the ZIP file or clone the repository using Git.
git clone https://github.com/DrizzlyQ/anti-crash-detector.git
2. Add to Your Server
Place the anti-crash-detector folder into your resources directory.

3. Configure the Script
Open config.lua.

Set your Discord Webhook URL in the following line:

lua
Copy
Edit
Config.Webhook = 'YOUR_DISCORD_WEBHOOK_HERE'
Configure spawn limits, time windows, and enable debug mode if needed:


Config.SpawnLimit = {
    ped = 10,
    vehicle = 10,
    object = 15
}

Config.TimeWindow = 10  -- In seconds
Config.DebugPrint = true  -- Set to true for debug logging

4. Ensure Resource is Started
Make sure the resource is started by adding the following line to your server.cfg:

ensure anti-crash-detector

5. (Optional) Install Screenshot-Tool
For optional screenshots, install screenshot-basic. Then, ensure it’s started before the Anti-Crash Detector:


ensure screenshot-basic
ensure anti-crash-detector

🔧 How It Works
Entity Spawn Detection:
The script tracks the spawn rate of peds, vehicles, and objects. If the rate exceeds the defined threshold within a short time frame, an alert is triggered.

Model Integrity Check:
Invalid or unknown model hashes are flagged. The script checks if the model exists in the game files and triggers an alert for any discrepancies.

Force Detection:
It checks for abuse of in-game physics, such as excessively high velocities or unnatural force applied to entities, signaling a potential exploit.

Discord Alerts:
Alerts are sent as beautifully formatted Discord embeds with relevant information such as:

Player name and ID.

Type of detection (e.g., spawn abuse, invalid model).

Detailed description of the issue (e.g., model hash or force vector).

Optional screenshot of the player's game view.

📸 Discord Webhook Alert Example
Here’s what a typical Discord alert might look like:

🚨 Crash Exploit Detected

Player: JohnDoe [ID: 12345]

Type: ⚠️ Spawn Rate Abuse

Details: Excessive ped spawns detected.

Time: 2025-04-19 10:15:30

Screenshot:

📄 License
This script is open-source and free to use. Feel free to modify, improve, and contribute to it.

💬 Support & Contributions
If you have any questions or would like to contribute to the project, feel free to:

Open an issue on GitHub.

Fork the repository and create a pull request.

Reach out to the author via Discord or GitHub.


