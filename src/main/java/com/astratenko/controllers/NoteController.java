package com.astratenko.controllers;

import com.astratenko.model.Note;
import com.astratenko.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Locale;


@Controller
public class NoteController {
    private NoteService noteService;

    @Autowired(required = true)
    @Qualifier(value = "noteService")
    public void setNoteService(NoteService noteService) {
        this.noteService = noteService;
    }

    @RequestMapping(value = "notes", method = RequestMethod.GET)
    public String listNotes(Model model) {
        model.addAttribute("note", new Note());
        model.addAttribute("listNotes", this.noteService.listNotes());


        return "notes";
    }

    @RequestMapping(value = "/notes/add", method = RequestMethod.POST)
    public String addNote(@ModelAttribute("note") Note note) {
        if (note.getId() == 0) {
            this.noteService.addNote(note);
        } else {
            this.noteService.updateNote(note);
        }

        return "redirect:/notes";
    }

    @RequestMapping("/remove/{id}")
    public String removeNote(@PathVariable("id") int id) {
        this.noteService.removeNote(id);

        return "redirect:/notes";
    }

    @RequestMapping("edit/{id}")
    public String editNote(@PathVariable("id") int id, Model model) {
        model.addAttribute("note", this.noteService.getNoteById(id));
        model.addAttribute("listNotes", this.noteService.listNotes());

        return "notes";
    }

    @RequestMapping("notedata/{id}")
    public String noteData(@PathVariable("id") int id, Model model) {
        model.addAttribute("note", this.noteService.getNoteById(id));

        return "notedata";
    }

    //AJAX response
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        return "notes";
    }

    @RequestMapping(value = "/getCharNum", method = RequestMethod.GET)
    public @ResponseBody
    Response getCharNum(@RequestParam String text) {

        Response result = new Response();

        if (text != null) {
            result.setText(text);
            result.setCount(text.length());
        }

        return result;
    }
}
