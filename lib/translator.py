import json
from googletrans import Translator

# Path to your original JSON file
input_file = "assets\labels/bird_info.json"
output_file = "bird_info_kannada.json"

# Load the original bird data
with open(input_file, "r", encoding="utf-8") as f:
    bird_data = json.load(f)

translator = Translator()
translated_data = []

for i, entry in enumerate(bird_data, start=1):
    chinese_name, english_name, sci_name = entry
    try:
        # Translate Chinese name to Kannada
        kannada_translation = translator.translate(chinese_name, src='zh-cn', dest='kn').text
    except Exception as e:
        print(f"Error translating {chinese_name}: {e}")
        kannada_translation = chinese_name  # fallback to original if translation fails

    translated_data.append([kannada_translation, english_name, sci_name])

    # Progress update every 50 entries
    if i % 50 == 0:
        print(f"Translated {i} entries...")

# Save the translated data to a new JSON file
with open(output_file, "w", encoding="utf-8") as f:
    json.dump(translated_data, f, ensure_ascii=False, indent=2)

print(f"Translation complete! Saved to {output_file}")
