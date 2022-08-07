# City Search

## Overview

Application demonstrating the use of a `Trie` data structure to search and 
display cities matching a query string provided by the user.

The trie data is stored using an efficient bit-packing format which allows the 
large number of entries to be loaded efficiently at runtime.   

We have a list of cities containing around 200k entries in JSON format. Each 
entry contains the following information:

```
{
    "country":"UA",
    "name":"Hurzuf",
    "_id":707860,
    "coord":{
            "lon":34.283333,
        "lat":44.549999
    }
}
```

The application includes the following features:

* Load the list of cities from [here](cities.json).
* Filter the results by a given prefix string, following these requirements:
     * See the prefix definition specified in the clarifications section below.
     * Uses a reasonably efficient Trie data structure for runtime searches with acceptable performance. 
     * Search is case insensitive.
* Display these cities in a scrollable list, in alphabetical order (city first, country after). Hence, "Denver, US" should appear before "Sydney, Australia".
     * The list is updated with every character added/removed to/from the filter.
     * The UI remains responsive while typing in a filter, even when displaying thousands of results.
* For each city's cell:
     * Show the city and country code as title.
     * Show the coordinates as subtitle.
     * When tapped, show the location of that city on a map.

## Additional requirements/restrictions:

* The original list of cities is provided as a plain text JSON format array. The list is preprocessed into a data representation that can be loaded more efficiently. 
* Provides unit tests, that your search algorithm is displaying the correct results giving different inputs, including invalid inputs.

## Clarifications

We define a prefix string as: a substring that matches the initial characters of the target string. For instance, assume the following entries:

* Alabama, US
* Albuquerque, US
* Anaheim, US
* Arizona, US
* Sydney, AU

If the given prefix is "A", all cities but Sydney should appear. Contrariwise, if the given prefix is "s", the only result should be "Sydney, AU".
If the given prefix is "Al", "Alabama, US" and "Albuquerque, US" are the only results.
If the prefix given is "Alb" then the only result is "Albuquerque, US"
