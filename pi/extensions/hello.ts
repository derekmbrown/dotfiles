import { execFile } from "node:child_process";
import { promisify } from "node:util";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { Box, Text, visibleWidth } from "@earendil-works/pi-tui";

const HELLO_MESSAGE_TYPE = "hello-neon-green";
const BLACK_BG = "\x1b[48;2;0;0;0m";
const NEON_GREEN_FG = "\x1b[38;2;57;255;20m";
const BOLD = "\x1b[1m";
const RESET = "\x1b[0m";
const execFileAsync = promisify(execFile);

export default function (pi: ExtensionAPI) {
  pi.registerMessageRenderer(HELLO_MESSAGE_TYPE, (message, _options, _theme) => {
    const box = new Box(1, 1, (text) => `${BLACK_BG}${NEON_GREEN_FG}${text}${RESET}`);
    box.addChild(new Text(`${BOLD}${message.content}${RESET}${BLACK_BG}${NEON_GREEN_FG}`, 0, 0));

    return {
      render: (width: number) => {
        const innerWidth = Math.max(1, width - 2);
        const lines = box.render(innerWidth);
        const contentWidth = Math.max(...lines.map((line) => visibleWidth(line)), 1);
        const border = (text: string) => `${NEON_GREEN_FG}${text}${RESET}`;

        return [
          border(`╭${"─".repeat(contentWidth)}╮`),
          ...lines.map((line) => `${border("│")}${line}${" ".repeat(Math.max(0, contentWidth - visibleWidth(line)))}${border("│")}`),
          border(`╰${"─".repeat(contentWidth)}╯`),
        ];
      },
      invalidate: () => box.invalidate(),
    };
  });

  pi.on("session_start", async (event, ctx) => {
    if (!ctx.hasUI) return;
    if (event.reason !== "startup") return;

    const { stdout } = await execFileAsync("whoami");
    const username = stdout.trim();

    const styledUsername = `${BOLD}${username.toUpperCase()}${RESET}${BLACK_BG}${NEON_GREEN_FG}${BOLD}`;

    pi.sendMessage({
      customType: HELLO_MESSAGE_TYPE,
      content: [
        `> ACCESS GRANTED :: USER=${styledUsername}`,
        `> SYS_TIME [${new Date().toLocaleTimeString("en-US", { hour12: true })}] // CONNECTED_`,
      ].join("\n"),
      display: true,
    });
  });
}
