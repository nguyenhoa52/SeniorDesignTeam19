from tkinter import *
from PIL import Image, ImageTk

class Window(Frame):
    
    def __init__(self, master=None):
        Frame.__init__(self, master)
        self.master = master
        self.init_window()
        
    def init_window(self):

        self.master.title("Project")
        self.pack(fill=BOTH, expand=1)

        menu = Menu(self.master)
        self.master.config(menu=menu)

        file = Menu(menu)
        file.add_command(label="Exit", command=self.exit)
        menu.add_cascade(label="File", menu=file)

        edit = Menu(menu)   
        edit.add_command(label="Show Picture", command=self.showImg)
        edit.add_command(label="Show Text", command=self.showText)
        menu.add_cascade(label="Edit", menu=edit)
        
        #quitButton = Button(self, text="Quit")
        #quitButton.place(x=0, y=0)

    def exit(self):
         exit()

    def showImg(self):
        load = Image.open("waves.png")
        render = ImageTk.PhotoImage(load)

        img = Label(self, image=render)
        img.image = render
        img.place(x=0, y=0)
        
    def showText(self):
        text = Label(self, text="Sample Waves")
        text.pack()
        
root = Tk()
root.geometry("1000x4000")

app = Window(root)

root.mainloop()
