import byllm

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=false);

walker test_llm {
    response = llm.chat("Say hello, I am testing the Gemini connection!");
    std.out("Gemini replied: " + response);
}

walker main {
    take --> test_llm;
}
