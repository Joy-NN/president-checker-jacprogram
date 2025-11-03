import byllm

# Define a global LLM model for the whole program
glob llm = byllm::Model(model_name="gemini/gemini-2.0-flash", verbose=false);

walker PresidentChecker {

    can run {
        country = input("Enter country (e.g., USA, Kenya, France, etc.): ");
        year = input("Enter year: ");

        query = f"Who was the president of {country} in {year}? Return only the name.";

        try {
            response = llm.prompt(query);

            if hasattr(response, "output_text") {
                print(f"The president of {country} in {year} was: {response.output_text}");
            } else {
                print("Sorry, I couldn't get a clear response from the model.");
            }
        } catch {
            print("Error: Unable to fetch response. Please check your API key or connection.");
        }
    }
}

# Entry point
walker_init("PresidentChecker").run();
