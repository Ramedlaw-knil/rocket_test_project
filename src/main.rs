use std::io;


#[macro_use] extern crate rocket;

#[get("/")]
async fn index() -> Result<&'static str, io::Error> {
    Ok("Hello, world!")
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index])
}
