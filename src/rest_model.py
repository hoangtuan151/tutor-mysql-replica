from pydantic import BaseModel


class RegisterAccountRequest(BaseModel):
    username: str


class RegisterAccountResponse(BaseModel):
    username: str
    user_id: str
