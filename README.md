# HANGMAN

Little hangman game collaborative project.

## Logigramme

Hangman gam flow chart : https://miro.com/app/board/uXjVP0PJHEg=/

API call use Cubit (Bloc) pattern : https://miro.com/app/board/uXjVPzyKnrc=/ (cf state management)

## API words :

Rapid api to get words from :
https://rapidapi.com/sheharyar566/api/random-words5

## State management :

Using cubit and 3 layers architecture:
https://bloclibrary.dev/#/fluttertodostutorial

## Branches

- main : to make newer version only ! (dev merge into main from a merge request)
- dev : to get code from and create/merge branch
- feature/<feature-name OR feature-scope> : to build new features and code before merge request into dev.

## Launch project

Copy this repo : git clone <url>.
Be sure to work on dev branch and create/merge branch from there !
Don't forgot to install dependencies : flutter get pub.
Don't forgot to add envionnment variables to a .env file at root of project.
Run locally on emulator.

## ENV

At root of folder, create a .env file :
API_KEY : Your private api key from rapid api
API_HOST : Your private host api url from rapid api

