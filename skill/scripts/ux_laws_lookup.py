import sys
import argparse

LAWS = {
    "aesthetic-usability": "Users perceive pleasing designs as more usable. Ensure beauty and function go hand-in-hand.",
    "fitts": "Targets should be large and close to minimize acquisition time. (Min 44x44px targets).",
    "goal-gradient": "Motivation increases as the user nears the finish line. Provide clear progress visibility.",
    "hick": "More choices = more decision time. Minimize options or use progressive disclosure.",
    "jakob": "Users expect your site to work like others they know. Use familiar icons and layouts.",
    "miller": "Working memory holds 7 ± 2 items. Chunk information into manageable groups.",
    "parkinson": "Tasks expand to fill allotted time. Design for speed and efficiency (autofill, etc.).",
    "common-region": "Elements in the same boundary belong together. Use borders/spacing to group.",
    "proximity": "Close elements belong together. Place labels near inputs.",
    "pragnanz": "Brain interprets complex images as simple shapes. Use squares/circles for UI.",
    "similarity": "Similar looking elements are perceived as a group. Keep styling consistent.",
    "connectedness": "Connected elements (lines/arrows) are seen as related.",
    "peak-end": "Users judge by the peak and end of an experience. Optimize key moments.",
    "serial-position": "Users remember first and last items best. Place critical info at ends.",
    "von-restorff": "Distinct elements are remembered best. Make CTAs stand out.",
    "zeigarnik": "Uncompleted tasks stick in memory. Use visual progress indicators.",
    "doherty": "Respond in <400ms for smoothness. Provide instant feedback.",
    "occam": "Simplest solution is best. Remove unnecessary elements.",
    "pareto": "80% of impact comes from 20% of features. Focus on high-impact areas.",
    "postel": "Be conservative in what you do, liberal in what you accept from others.",
    "tesler": "Complexity cannot be reduced, only shifted. Don't oversimplify functionality."
}

def main():
    parser = argparse.ArgumentParser(description="Lookup any of the 21 Laws of UX.")
    parser.add_argument("query", nargs="?", help="Name of the law or 'list' to see all.")
    args = parser.parse_args()

    if not args.query or args.query == "list":
        print("\nAvailable UX Laws:")
        for key in LAWS.keys():
            print(f" - {key}")
        sys.exit(0)

    law = LAWS.get(args.query.lower())
    if law:
        print(f"\n[{args.query.upper()}]")
        print(law)
    else:
        print(f"Law '{args.query}' not found. Use 'list' to see available laws.")

if __name__ == "__main__":
    main()
