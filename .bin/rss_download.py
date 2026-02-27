#!/usr/bin/env python3
import feedparser
import pandas as pd

# Nature Microbiome RSS feed
feed_url = "https://www.nature.com/subjects/microbiome.rss"

# Parse RSS feed
feed = feedparser.parse(feed_url)

# Extract last 10 entries
entries = feed.entries[:10]

# Collect data
data = []
for e in entries:
    title = e.get("title", "")
    link = e.get("link", "")
    summary = e.get("summary", "").replace("\n", " ").strip()
    published = e.get("published", "")
    journal = "Nature"  # feed is from Nature subject page

    data.append({
        "date": published,
        "title": title,
        "abstract_or_summary": summary,
        "journal": journal,
        "link": link
    })

# Convert to DataFrame
df = pd.DataFrame(data)

# Save to TSV
df.to_csv("nature_microbiome_last10.tsv", sep="\t", index=False)

print("Saved last 10 Nature Microbiome articles to nature_microbiome_last10.tsv")

