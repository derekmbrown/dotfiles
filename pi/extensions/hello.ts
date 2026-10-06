import { hostname, userInfo } from "node:os";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { Box, Text, visibleWidth } from "@earendil-works/pi-tui";

const GREEN = "\x1b[38;2;57;255;20m";
const AMBER = "\x1b[38;2;255;176;0m";
const CYAN = "\x1b[38;2;0;255;255m";
const BLACK_BG = "\x1b[48;2;0;0;0m";
const BOLD = "\x1b[1m";
const DIM = "\x1b[2m";
const NORMAL = "\x1b[22m"; // turns off bold/dim
const RESET = "\x1b[0m";

const label = (text: string) => `${DIM}${text}${NORMAL}`;
const value = (text: string) => `${CYAN}${BOLD}${text}${NORMAL}${GREEN}`;

export default function (pi: ExtensionAPI) {
  pi.registerMessageRenderer("hello", (message) => {
    const box = new Box(1, 1, (text) => `${BLACK_BG}${GREEN}${text}${RESET}`);
    box.addChild(new Text(String(message.content), 0, 0));

    return {
      invalidate: () => box.invalidate(),
      render: (width: number) => {
        const lines = box.render(width - 2);
        const inner = Math.max(...lines.map((line) => visibleWidth(line)));
        const edge = (text: string) => `${GREEN}${text}${RESET}`;
        const pad = (line: string) => line + " ".repeat(inner - visibleWidth(line));

        return [
          edge(`╭${"─".repeat(inner)}╮`),
          ...lines.map((line) => edge("│") + pad(line) + edge("│")),
          edge(`╰${"─".repeat(inner)}╯`),
        ];
      },
    };
  });

  pi.on("session_start", (event, ctx) => {
    if (!ctx.hasUI || event.reason !== "startup") return;

    const now = new Date();
    const date = now
      .toLocaleDateString("en-US", { weekday: "short", month: "short", day: "2-digit", year: "numeric" })
      .replace(/,/g, "")
      .toUpperCase();
    const time = now.toLocaleTimeString("en-US");

    const lines = [
      `${AMBER}${BOLD}> ACCESS GRANTED${NORMAL}${GREEN} ${label("::")} ${label("USER")} ${value(userInfo().username.toUpperCase())}`,
      `> ${label("MACHINE ")} ${label("::")} ${value(hostname())}`,
      `> ${label("SYS_DATE")} ${label("::")} ${value(date)}`,
      `> ${label("SYS_TIME")} ${label("::")} ${value(time)} ${label("//")} ${BOLD}CONNECTED_${NORMAL}`,
    ];

    pi.sendMessage({ customType: "hello", content: lines.join("\n"), display: true });
  });
}
