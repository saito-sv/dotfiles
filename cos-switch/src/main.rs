use serde::Deserialize;
use std::collections::HashMap;
use std::env;
use std::process::Command;
use std::thread;
use std::time::Duration;

#[derive(Deserialize, Debug)]
struct CosmicApp {
    index: usize,
    app_id: String,
}

#[derive(Deserialize, Debug)]
struct CosmicInfo {
    apps: Vec<CosmicApp>,
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: cos-switch <app>");
        std::process::exit(1);
    }

    let name = args[1].to_lowercase();

    // EDIT HERE if your launch commands are different
    let mappings: HashMap<&str, (&str, &str)> = [
        ("zen",      ("zen",      "zen")),
        ("kitty",    ("kitty",    "kitty")),
        ("slack",    ("slack",    "flatpak run com.slack.Slack")),
        ("firefox",  ("firefox",  "firefox")),
        ("obsidian", ("obsidian", "flatpak run md.obsidian.Obsidian")),
    ].iter().cloned().collect();

    let (search_id, launch_cmd) = match mappings.get(name.as_str()) {
        Some(&pair) => pair,
        None => {
            let _ = Command::new("notify-send")
                .args(&["cos-switch", &format!("Unknown app: {}", name)])
                .output();
            std::process::exit(1);
        }
    };

    let mut launched = false;

    for attempt in 0..30 {
        if let Ok(output) = Command::new("cos-cli").args(&["info", "--json"]).output() {
            if let Ok(info) = serde_json::from_slice::<CosmicInfo>(&output.stdout) {
                if let Some(app) = info.apps.iter().find(|a| 
                    a.app_id.to_lowercase().contains(search_id)
                ) {
                    let _ = Command::new("cos-cli")
                        .args(&["activate", "-i", &app.index.to_string()])
                        .output();
                    return;
                }
            }
        }

        if attempt == 0 && !launched {
            let _ = Command::new("sh")
                .arg("-c")
                .arg(launch_cmd)
                .spawn();
            launched = true;
        }

        thread::sleep(Duration::from_millis(110));
    }

    let _ = Command::new("notify-send")
        .args(&["cos-switch", &format!("Failed to switch to {}", name)])
        .output();
}
