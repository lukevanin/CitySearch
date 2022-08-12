# City Search

Example application demonstrating:
- Using a Trie data structure to efficiently search and return relatively large 
amounts of data with interactive performance. 
- Using an efficient data encoding format for storing and loading structure data 
at runtime.

The application makes use of the following packages:  

### TextIndex

()[https://github.com/lukevanin/TextIndex] 

TextIndex is used to search a database of of cities consisting of 200k 
entries, and retrieve a subset according to a search term entered by a user.
Various optimizations are used to search and return results consisting of tens 
of thousands of matches within a few milliseconds. 

### SwiftPack

()[https://github.com/lukevanin/SwiftPack]

SwiftPack is used to store the text index data on disk so that it can be
loaded into memory efficiently. An efficient coding mechanism allows data to be
read an order of magnitude faster compared to JSON. 

## Features

The app displays a list of 200k cities and their locations. The user can search
for all cities whose name starts with a user provided prefix.
 
Each entry contains the following information:

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

* The original list of cities is provided as a plain text JSON format array. The 
list is preprocessed into a data representation that can be loaded 
more efficiently. 
* Provides unit tests, that your search algorithm is displaying the correct 
results giving different inputs, including invalid inputs.

We define a prefix string as: a substring that matches the initial characters of 
the target string. For instance, assume the following entries:

* Alabama, US
* Albuquerque, US
* Anaheim, US
* Arizona, US
* Sydney, AU

If the given prefix is "A", all cities but Sydney should appear. Contrariwise, 
if the given prefix is "s", the only result should be "Sydney, AU". If the given 
prefix is "Al", "Alabama, US" and "Albuquerque, US" are the only results. If the 
prefix given is "Alb" then the only result is "Albuquerque, US"

## TODO:

- The encoded data is created when running a specific unit test. It would be 
better to encode data at build time, or when the application is first launched.
