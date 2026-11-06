#!/bin/sh
# Install the complete skill from this checkout into an explicitly selected project.
set -eu
usage() { printf '%s\n' 'Usage: ./scripts/install.sh {codex|claude|copilot|gemini} /path/to/website-project' '       ./scripts/install.sh custom /path/to/skills-directory' 'Existing installations are never overwritten.'; }
[ "$#" -eq 2 ] || { usage >&2; exit 2; }
case "$1" in
  codex) skill_dir='.agents/skills' ;;
  claude) skill_dir='.claude/skills' ;;
  copilot) skill_dir='.github/skills' ;;
  gemini) skill_dir='.gemini/skills' ;;
  custom) skill_dir='' ;;
  *) usage >&2; exit 2 ;;
esac
[ -d "$2" ] || { printf 'Project directory does not exist: %s\n' "$2" >&2; exit 1; }
project_dir=$(cd "$2" && pwd -P)
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")/../skills/aliasopti" && pwd -P)
destination="${project_dir}${skill_dir:+/$skill_dir}/aliasopti"
[ ! -e "$destination" ] && [ ! -L "$destination" ] || { printf 'Installation already exists: %s\nInspect or move it before installing again.\n' "$destination" >&2; exit 1; }
for file in SKILL.md references/playbook.md references/troubleshooting.md; do
  [ -f "$source_dir/$file" ] || { printf 'Missing source file: %s\n' "$source_dir/$file" >&2; exit 1; }
done
mkdir -p "${project_dir}${skill_dir:+/$skill_dir}"
cp -R "$source_dir" "$destination"
for file in SKILL.md references/playbook.md references/troubleshooting.md; do
  cmp -s "$source_dir/$file" "$destination/$file" || { printf 'Verification failed: %s\n' "$destination/$file" >&2; exit 1; }
done
printf 'Installed AliasOpti: %s\n' "$destination"
printf '%s\n' 'Open the website project in your agent. If needed, refresh its skill list or start a new session.'
