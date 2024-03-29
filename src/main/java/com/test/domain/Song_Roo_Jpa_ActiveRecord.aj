// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.test.domain;

import com.test.domain.Song;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Song_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Song.entityManager;
    
    public static final EntityManager Song.entityManager() {
        EntityManager em = new Song().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Song.countSongs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Song o", Long.class).getSingleResult();
    }
    
    public static List<Song> Song.findAllSongs() {
        return entityManager().createQuery("SELECT o FROM Song o", Song.class).getResultList();
    }
    
    public static Song Song.findSong(Long id) {
        if (id == null) return null;
        return entityManager().find(Song.class, id);
    }
    
    public static List<Song> Song.findSongEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Song o", Song.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Song.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Song.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Song attached = Song.findSong(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Song.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Song.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Song Song.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Song merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
