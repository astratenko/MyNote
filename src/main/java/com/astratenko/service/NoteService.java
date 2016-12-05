package com.astratenko.service;

import com.astratenko.model.Note;

import java.util.List;

/**
 * Created by Maxim on 28.11.2016.
 */
public interface NoteService {
    public void addNote(Note note);

    public void updateNote(Note note);

    public void removeNote(int id);

    public Note getNoteById(int id);

    public List<Note> listNotes();
}
