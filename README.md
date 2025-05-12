# macOS Automations

A collections of scripts and automations to improve productivity on macOS


## Open With VS Code
A simple macOS app wrapping a shell script to open launch and open VS Code on a specified folder.

Press 'command' key and drag this app on Finder toolbar: a icon button will appear to have a quick and easy way to open in VS Code the currently opened folder in Finder.

Browse your file system and open the desider folder, then simply click on the button to launch VS Code.

Credits to Fabio Copes and details at https://flaviocopes.com/how-to-add-an-open-in-vs-code-icon-in-macos-finder/

## Open With iTerm
Same as previous app, just launching a new iTerm window on the folder currently opened in Finder.


## Shrink PDF file
A quick action which shrinks PDF files. It duplicates the file and shrink it using the export Quartz filter

Installation steps:
* Copy the workflow file in $HOME/Library/Service
* Open Finder -> Quick Actions -> Customize and add tick this action

## Screenshots location
Change default folder to save screenshots and screen captures.

```
./screenshot-location.sh $HOME/Downloads/ScreenCaptures
```

## Rename files so alphabetical and chronological order match
Copy the **"rename_dates.command"** file in the same folder where your files are stored.
From Finder, double click on it to execute it. Original files will be moved in the **"orig"** subfolder
Tune the matching and rename patterns as needed.

