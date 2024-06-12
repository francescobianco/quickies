-- 
-- Table structure for table `q_category`
-- 

CREATE TABLE q_category (
                            id INTEGER PRIMARY KEY AUTOINCREMENT,
                            name TEXT NOT NULL,
                            UNIQUE (name)
);

-- Full-text search is not directly converted because it's handled differently in SQLite.
-- We will use an FTS virtual table for the full-text search.

-- --------------------------------------------------------

--
-- Table structure for table `q_note`
--

CREATE TABLE q_note (
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        category_id INTEGER,
                        timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
                        title TEXT DEFAULT NULL,
                        text TEXT,
                        FOREIGN KEY (category_id) REFERENCES q_category(id)
);

CREATE INDEX idx_category_id ON q_note(category_id);

-- Trigger to update timestamp on row update
CREATE TRIGGER update_timestamp
    AFTER UPDATE ON q_note
    FOR EACH ROW
    WHEN NEW.timestamp <= OLD.timestamp
BEGIN
    UPDATE q_note
    SET timestamp = CURRENT_TIMESTAMP
    WHERE id = OLD.id;
END;

-- Create FTS virtual table for full-text search
CREATE VIRTUAL TABLE q_note_fts USING fts5(text);

-- Populate the FTS table with existing data
INSERT INTO q_note_fts (text)
SELECT text FROM q_note;

-- Assuming you also want to search `name` in `q_category`
CREATE VIRTUAL TABLE q_category_fts USING fts5(name);

-- Populate the FTS table with existing data
INSERT INTO q_category_fts (name)
SELECT name FROM q_category;




-- Insert demo records into q_note
INSERT INTO q_note (category_id, title, text) VALUES (1, 'Physics Note', 'This is a note about physics.');
INSERT INTO q_note (category_id, title, text) VALUES (2, 'Programming Note', 'This is a note about programming.');
INSERT INTO q_note (category_id, title, text) VALUES (3, 'Mechanical Engineering Note', 'This is a note about mechanical engineering.');
INSERT INTO q_note (category_id, title, text) VALUES (4, 'Calculus Note', 'This is a note about calculus.');

-- Populate the FTS table with existing data
INSERT INTO q_note_fts (text)
SELECT text FROM q_note;