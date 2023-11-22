import motor.motor_asyncio
from motor.motor_asyncio import AsyncIOMotorClient
import pymongo, os
from config import DB_URI, DB_NAME


dbclient = AsyncIOMotorClient(DB_URI)
database = dbclient[DB_NAME]


user_data = database['users']

def new_user(id):
    return dict(
        _id = id,
        verify_status=dict(
            is_verified=False,
            verified_time="",
            verify_token="",
            link=""
    ))


async def present_user(user_id : int):
    found = user_data.find_one({'_id': user_id})
    return bool(found)

async def add_user(user_id: int):
    user = new_user(user_id)
    user_data.insert_one(user)
    return

async def full_userbase():
    user_docs = user_data.find()
    user_ids = []
    for doc in user_docs:
        user_ids.append(doc['_id'])
        
    return user_ids

async def del_user(user_id: int):
    user_data.delete_one({'_id': user_id})
    return
