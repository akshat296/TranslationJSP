package com.devsphere.examples.mapping.internat;

public class InternatBeanResources extends java.util.ListResourceBundle {
    private static final Object[][] contents = {
        { "[internat.LANGUAGE_NAME]", "English" },
        { "[ERROR_MESSAGE.date]", "must be a valid date." },
        { "[ERROR_MESSAGE.number]", "must be a valid number." },
        {
            "[PROCESSING_ORDER]",
            new String[] {
                "language",
                "date",
                "number"
            }
        },
        { "[FORM_NAME]", "InternatForm.html" },
        { "[PROC_NAME]", "InternatProc.jsp" }
    };

    public Object[][] getContents() {
        return contents;
    }

}