# HANGMAN

Starting a little hangman game collaborative project.

## API words :

Rapid api to get words from :
https://rapidapi.com/sheharyar566/api/random-words5

For testing purpose, use local array of words as the free API access is limited to 250 reqs/month.

## State management :

To maintain and update state we are using cubit and 3 layers architecture:
https://bloclibrary.dev/#/fluttertodostutorial

Working principle :
![Architecture](schema/QCS_Cubit.jpg)

## Branches

- main : to make newer version only ! (dev merge into main from a merge request)
- dev : to get code from and create/merge branch
- feature/<feature-name-scope> : to build new features and code before merge request into dev.

## Launching project

Copy this repo : git clone <url>.
Be sure to work on dev branch and create/merge branch from there !
Don't forgot to install dependencies : flutter get pub.
Don't forgot to add envionnment variables to a .env file at root of project.
Run locally on emulator.

## Environnement variables

At root of folder, create a .env file with following variables:

[API_KEY]  : Your private api key from rapid api
[API_HOST] : Your private host api url from rapid api

