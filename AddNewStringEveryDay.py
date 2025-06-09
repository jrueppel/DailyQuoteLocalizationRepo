import requests
from datetime import datetime
import subprocess
import os
import re
import sys

print(">>> Script started", flush=True)

# CONFIG
REPO_DIR = "/Users/jeffrueppel/Documents/GitHub/DailyQuoteLocalizationRepo"  # Replace this
STRINGS_FILE = os.path.join(REPO_DIR, "daily_sentences.strings")
ZENQUOTES_API_KEY = "your_api_key_here"  # Replace with your actual key
ZENQUOTES_URL = f"https://zenquotes.io/api/quotes/{ZENQUOTES_API_KEY}"



def sanitize_author(author):
    # Replace spaces with underscores and strip non-alphanumerics
    return re.sub(r'\W+', '', author.replace(" ", "_"))

def fetch_quote_data():
    response = requests.get(ZENQUOTES_URL)
    if response.status_code == 200:
        data = response.json()
        if isinstance(data, list) and len(data) > 0:
            quote = data[0].get("q", "").strip()
            author = data[0].get("a", "Unknown").strip()
            return quote, author
        else:
            raise Exception("Empty quote data.")
    else:
        raise Exception(f"Failed to fetch quote: {response.status_code} - {response.text}")
    # After fetching the quote:
    print(f">>> Quote fetched: \"{quote}\" by {author}", flush=True)



def append_to_file(quote, author):
    date_str = datetime.now().strftime("%Y-%m-%d")
    author_key = sanitize_author(author)
    key = f"{date_str}_{author_key}"
    with open(STRINGS_FILE, "a") as f:
        f.write(f'"{key}" = "{quote}";\n')
    # After writing to the .strings file:
    print(f">>> Added to .strings file: key = {key}", flush=True)


def git_commit_push():
    subprocess.run(["git", "add", "."], cwd=REPO_DIR)
    commit_msg = f"Add quote for {datetime.now().strftime('%Y-%m-%d')}"
    subprocess.run(["git", "commit", "-m", commit_msg], cwd=REPO_DIR)
    subprocess.run(["git", "push"], cwd=REPO_DIR)
    # After git commit/push:
    print(">>> Git push complete", flush=True)

def main():
    try:
        quote, author = fetch_quote_data()
        append_to_file(quote, author)
        git_commit_push()
        print("Daily quote added and pushed.")
        print(">>> Script finished")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
