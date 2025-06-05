use std::fs;
use std::error::Error;
use rusqlite::{Connection, Result};

pub fn init_database(conn: &Connection) -> Result<(), Box<dyn Error>> {
    let sql = fs::read_to_string("db/init_caisse.sql")?;
    conn.execute_batch(&sql)?;
    Ok(())
}

pub fn establish_connection() -> Result<Connection, rusqlite::Error> {
    Connection::open("db/caisse.db")
}
