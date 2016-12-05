package com.astratenko.DAO;

import com.astratenko.model.Note;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NoteDAOImpl implements NoteDAO {

    private static final Logger logger = LoggerFactory.getLogger(NoteDAO.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addNote(Note note) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(note);
        logger.info("Note successfully saved. Note details: " + note);
    }

    public void updateNote(Note note) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(note);
        logger.info("Note successfully update. Note details: " + note);
    }

    public void removeNote(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Note note = (Note) session.load(Note.class, new Integer(id));

        if (note != null) {
            session.delete(note);
        }
        logger.info("Note successfully removed. Note details: " + note);
    }

    public Note getNoteById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Note note = (Note) session.load(Note.class, new Integer(id));
        logger.info("Note successfully loaded. Note details: " + note);

        return note;
    }

    @SuppressWarnings("unchecked")
    public List<Note> listNotes() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Note> notesList = session.createQuery("from Note").list();

        for (Note note : notesList) {
            logger.info("Note list: " + note);
        }

        return notesList;
    }
}
