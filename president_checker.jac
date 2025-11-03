import from byllm.lib { Model }

glob llm = Model(model_name = "gemini/gemini-2.0-flash");

"""Ask Gemini who was the president of a given country in a specific year."""
def get_president(country: str, year: str) -> str by llm();

with entry {
    print("=== President Checker (Gemini) ===");

    country = input("Enter country: ").strip();
    year = input("Enter year: ").strip();

    if country == "" or year == "" {
        print("⚠️ Both fields are required!");
    } else {
        result = get_president(country, year);
        print(f"\n👑 President of {country} in {year}: {result}");
    }
}
