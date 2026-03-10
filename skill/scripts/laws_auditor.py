import argparse
import os

LAWS_CHECKLIST = [
    ("Hick's Law", "Are choices minimized to reduce decision fatigue?"),
    ("Fitts's Law", "Are primary touch targets at least 44x44px and easy to reach?"),
    ("Jakob's Law", "Does the UI follow standard patterns the user already knows?"),
    ("Miller's Law", "Is information chunked into groups of 5-7 items?"),
    ("Goal-Gradient", "Is there clear progress visibility for multi-step tasks?"),
    ("Doherty Threshold", "Does the system provide feedback within 400ms?"),
    ("Von Restorff", "Is the primary CTA visually distinct from everything else?"),
    ("Peak-End Rule", "Is the final step of the journey positive and memorable?"),
    ("Occam's Razor", "Have all unnecessary visual elements been removed?")
]

def run_audit(path):
    print(f"\n--- 🛡️ UX LAWS AUDIT: {path} ---\n")
    for law, question in LAWS_CHECKLIST:
        print(f"[ ] {law:<18} | {question}")
    print("\n----------------------------------------")
    print("Audit framework loaded. Manually verify against implementation.")

def main():
    parser = argparse.ArgumentParser(description="Run a UX Laws audit on a project.")
    parser.add_argument("path", help="Path to the project or file to audit.")
    args = parser.parse_args()
    run_audit(args.path)

if __name__ == "__main__":
    main()
