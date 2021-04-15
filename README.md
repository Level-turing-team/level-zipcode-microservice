<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![Build Status](https://travis-ci.com/Level-turing-team/level-zipcode-microservice.svg?branch=main)](https://travis-ci.com/Level-turing-team/level-zipcode-microservice)
<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
      </ul>
    </li>
    <li><a href="#rest-endpoints">ReST Endpoints</a></li>

  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
This repository serves as a microservice to digest the zipcodebase api endpoints. 


### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Postman](https://www.postman.com/)

<!-- GETTING STARTED -->
## Getting Started

1. Clone this repo
2. Install gem packages: `bundle install`
4. Local development needs an API key `https://app.zipcodebase.com/register?plan=free`
5. Create `.env` under `/app` 
```E.G
ZIPCODEBASE_APIKEY = 'your token'

```
7. Start sinatra server
```
 $rackup
 "rackup will let you know which localhost port to navigate to"
```
### Prerequisites

* Ruby 2.5.3
* Rails 5.2.5

<!-- USAGE EXAMPLES -->


<details open>
<summary>ReST Endpoints</summary>
<br>
  
### Get Distance
* Returns distance between two zipcodes
> Required Parameters: `:code` `:compare`
```
GET /distance/:code/:compare
```

### Get Radius
* Returns all zipcodes within a given radius
> Required Parameters: `:origina_code` `:valid_code`
```
GET /distance/:original_code/:valid_code
```

</details>

