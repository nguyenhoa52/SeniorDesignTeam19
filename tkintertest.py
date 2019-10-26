from tkinter import *

class Window(Frame):
    
    def __init__(self, master=None):
        Frame.__init__(self, master)
        self.master = master
        self.init_window()

    def exit(self):
        exit()
        
    def init_window(self):

        self.master.title("Project")
        self.pack(fill=BOTH, expand=1)

        menu = Menu(self.master)
        self.master.config(menu=menu)

        file = Menu(menu)
        
        file.add_command(label="Exit", command=self.exit)
        menu.add_cascade(label="File", menu=file)

        edit = Menu(menu)
        
        edit.add_command(label="Undo")
        menu.add_cascade(label="Edit", menu=edit)
        
        #quitButton = Button(self, text="Quit")
        #quitButton.place(x=0, y=0)
 
        

root = Tk()
root.geometry("1080x1080")

app = Window(root)

root.mainloop()
