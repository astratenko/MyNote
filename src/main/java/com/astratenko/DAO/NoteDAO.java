package com.astratenko.DAO;

import com.astratenko.model.Note;

import java.util.List;

/**
 * Created by Maxim on 27.11.2016.
 */
public interface NoteDAO {
    public void addNote(Note note);

    public void updateNote(Note note);

    public void removeNote(int id);

    public Note getNoteById(int id);

    public List<Note> listNotes();


}
