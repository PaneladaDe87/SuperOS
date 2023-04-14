import kivy
kivy.require('1.11.1')

from kivy.app import App

GUI = kivy.load_file("screenMain.kv")

class Build_App(App):
    def Build(self):
        return GUI

if __name__ == "__main__":
    Build_App().run()
