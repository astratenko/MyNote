package com.astratenko.service;

import com.astratenko.DAO.NoteDAO;
import com.astratenko.model.Note;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


public class NoteServiceImpl implements NoteService {
    private NoteDAO noteDAO;

    public void setNoteDAO(NoteDAO noteDAO) {
        this.noteDAO = noteDAO;
    }

    @Override
    @Transactional
    public void addNote(Note note) {
    this.noteDAO.addNote(note);
    }

    @Override
    @Transactional
    public void updateNote(Note note) {
this.noteDAO.updateNote(note);
    }

    @Override
    @Transactional
    public void removeNote(int id) {
    this.noteDAO.removeNote(id);
    }

    @Override
    @Transactional
    public Note getNoteById(int id) {
        return this.noteDAO.getNoteById(id);
    }

    @Override
    @Transactional
    public List<Note> listNotes() {
        return this.noteDAO.listNotes();
    }
}
