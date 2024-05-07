# AI Api SUITE Setup
This is our AI suite. Most of it will be self-hosted as it saves on a ton (Currently) and potentially into the future. This repo aims to quickly explain how to bootstrap the tools needed for local / production development.

_**Warning, Setup currently only supports macos, but would love for anyone else to support it for linux (Will do it myself in the future, but currently focused on developing way faster)**_

## What you can expect from this repo:
- Setup for local AI tools such as whisper, ollama, ollama-webui, stable-diffusion-webui (With their apis)
- Setup of Free OSS software to quickly deploy / test services 

## Tools allowed in Automa's SelfHosted ToolChain
- Should be free for business use
- Should have both mac & linux support (Most of the tools will as they will come as a linux install)
- Should be independant of the project - meaning we can use it without complex prod/stage/beta-testing workflows -.
    Examples are:
    - Whisper (Both staging + prod + local development can use the same api endpoint)
    - Ollama (Both staging + prod + local development can use the same api endpoint)
    - Stable Diffusion (Both staging + prod + local development can use the same api endpoint) 

## Local Tools Setup
Here we setup all the tools that are technically required to run locally. No worries, as the script to setup allows you to define specifically which tools you want to run on the existing machine you are on (Meaning you can use cloud compute to deploy these as well, such as digital ocean / gcp apprun ) 

### Script execution help
Script Execution Format:
`./auto-setup.sh --apps=comma,seperated,apps`
If you type this: `./auto-setup.sh` or `./auto-setup.sh --apps=all` it will setup all the applications to run locally

### Current Locally Hosted Applicications
- Ollama `ollama`
- Ollama Web-UI (Using Docker) `ollama-web`
- ComfyUI Selfhosted (They unload the model from memory after use, which is better for our usecase!)


