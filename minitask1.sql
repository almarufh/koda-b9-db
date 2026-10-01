CREATE TABLE events (
    event_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL
);

TABLE events;

INSERT INTO
    events (event_name, start_date)
VALUES
    ('Event A', '2024-01-01'),
    ('Event B', '2024-01-05'),
    ('Event C', '2024-01-10');

SELECT e.event_id, e.event_name Event, e.start_date, STRING_AGG(CONCAT(ev.event_name, ' ', ev.start_date), ', ') "Next Event"
FROM events e
LEFT JOIN events ev ON e.start_date < ev.start_date
GROUP BY e.event_id
ORDER BY e.event_id;