pragma Singleton
import Quickshell
import Quickshell.Services.UPower

Singleton {
    property int percentage: Math.round(UPower.displayDevice.percentage * 100)
    property string text: battery_icon(UPower.displayDevice.iconName) + " " + percentage + "%"

    function charging_percentage_icon() {
        let icons = ["󰢟 ", "󰢜 ", "󰂆 ", "󰂇 ", "󰂈 ", "󰢝 ", "󰂉 ", "󰢞 ", "󰂊 ", "󰂋 ", "󰂅 "];
        return icons[Math.round(percentage / 10)];
    }

    function percentage_icon() {
        let icons = ["󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"];
        return icons[Math.round(percentage / 10)];
    }

    function battery_icon(name) {
        switch (name) {
        case "ac-adapter-symbolic":
            return "";
        case "battery-missing-symbolic":
            return "󱟩";
        case "battery-empty-symbolic":
            return "󰂎";
        case "battery-caution-charging-symbolic":
        case "battery-caution-symbolic":
            return "󰂃";
        case "battery-full-charging-symbolic":
        case "battery-good-charging-symbolic":
        case "battery-low-charging-symbolic":
            return charging_percentage_icon();
        case "battery-full-symbolic":
        case "battery-good-symbolic":
        case "battery-low-symbolic":
            return percentage_icon();
        default:
            return "󰂑";
        }
    }
}
