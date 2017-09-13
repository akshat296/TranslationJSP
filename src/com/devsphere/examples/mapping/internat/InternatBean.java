package com.devsphere.examples.mapping.internat;

import java.text.*;
import java.util.*;

/**
 * InternatBean class
 */
public class InternatBean implements java.io.Serializable {
    public static final Date DATE_EXAMPLE = new Date();
    public static final float NUMBER_EXAMPLE = 123.45f;
    public static final Locale LOCALES[] = {
        new Locale("en", "", ""), // English
        new Locale("de", "", ""), // German
        new Locale("fr", "", ""), // French
        new Locale("it", "", ""), // Italian
        new Locale("es", "", "")  // Spanish
    };

    private int language;
    private String date;
    private Date parsedDate;
    private DateFormat cachedDateFormat;
    private String number;
    private float parsedNumber;
    private NumberFormat cachedNumberFormat;

    /**
     * No-arg constructor
     */
    public InternatBean() {
    }

    /**
     * Gets the language property
     */
    public int getLanguage() {
        return this.language;
    }

    /**
     * Sets the language property
     */
    public void setLanguage(int value) {
        if (value < 0 || value >= LOCALES.length)
            throw new IllegalArgumentException();
        language = value;
        cachedDateFormat = null;
        cachedNumberFormat = null;
    }

    /**
     * Gets the locale object
     */
    public Locale getLocale() {
        return LOCALES[getLanguage()];
    }

    /**
     * Gets the date property
     */
    public String getDate() {
        return date;
    }

    /**
     * Sets the date property
     */
    public void setDate(String value) {
        try {
            setParsedDate(getDateFormat().parse(value));
        } catch (ParseException e) {
            throw new IllegalArgumentException();
        }
    }

    /**
     * Gets the parsed date
     */
    public Date getParsedDate() {
        return parsedDate;
    }

    /**
     * Sets the date property
     */
    public void setParsedDate(Date value) {
        parsedDate = value;
        date = getDateFormat().format(parsedDate);
    }

    /**
     * Gets an example for the date property
     */
    public String getDateExample() {
        return getDateFormat().format(DATE_EXAMPLE);
    }

    /**
     * Gets the date format
     */
    public DateFormat getDateFormat() {
        if (cachedDateFormat == null)
            cachedDateFormat = DateFormat.getDateInstance(
                DateFormat.SHORT, getLocale());
        return cachedDateFormat;
    }

    /**
     * Gets the number property
     */
    public String getNumber() {
        return number;
    }

    /**
     * Sets the number property
     */
    public void setNumber(String value) {
        try {
            setParsedNumber(getNumberFormat().parse(value).floatValue());
            number = getNumberFormat().format(parsedNumber);
        } catch (ParseException e) {
            throw new IllegalArgumentException();
        }
    }

    /**
     * Gets the parsed number
     */
    public float getParsedNumber() {
        return parsedNumber;
    }

    /**
     * Sets the number property
     */
    public void setParsedNumber(float value) {
        parsedNumber = value;
        number = getNumberFormat().format(parsedNumber);
    }

    /**
     * Gets an example for the number property
     */
    public String getNumberExample() {
        return getNumberFormat().format(NUMBER_EXAMPLE);
    }

    /**
     * Gets the number format
     */
    public NumberFormat getNumberFormat() {
        if (cachedNumberFormat == null)
            cachedNumberFormat = NumberFormat.getNumberInstance(getLocale());
        return cachedNumberFormat;
    }

}