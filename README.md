# Semaphore Transactional
Ruby Version: **2.7.4**
<hr />

## Get Started
### Use MySQL Database
Edit config/database.yml with your develoment credentials.
### Please install dependencies with:
```
bundle install
```
### Create and Migrate de DataBase:
To Create de Database and the Structure:

```
rake db:create
#and
rake db:migrate
```

### To Populate de DataBase:
Check db/seeds.rb to see the initial data, to populate run:

```
rails db:seed
```

### To see all API Endpoints:
```
rake routes
```

### Security and Authentication:
All Endpoints to create and check Transactions are Authenticate,  you need to be login and use credentials in Header Response:

#### To Login:
* POST /user_auth/sign_in
```
{
  "email":"josepe@example.com",
  "password": "1234567"
}
```

#### Response Header:
```
access-token: t3HwqW7DRwcjPOcYCwPSGA
token-type: Bearer
client:  Ed9F0TWZXl7OTa-6zuumsQ
expiry: 1694485278
uid: josepe@example.com 
authorization:  Bearer eyJhY2Nlc3MtdG9rZW4i...
```

#### To Create Transaction:
* POST /transactions
```
{
  "transaction": {
    "sender_code" : "0705578CA81073524E7F29FD41226B04",
    "receiver_code" : "B6F73663E8788C0038A7D5E715B672EB",
    "amount": 1.99,
    "concept": "test"
  }
}
```
#### Response Created Transaction:
```
{
  "id": 5,
  "user_id": 1,
  "tx_id": "TX-8E68575864-12092022",
  "sender_code": "0705578CA81073524E7F29FD41226B04",
  "receiver_code": "B6F73663E8788C0038A7D5E715B672EB",
  "status": 0,
  "amount": "1.99",
  "concept": "test",
  "meta_data": null,
  "created_at": "2022-09-12T08:31:31.000Z",
  "updated_at": "2022-09-12T08:31:31.000Z",
  "status_text": "Pending"
}
```

#### To Check Transaction:
* GET /transactions/{tx_id}
```
Example:
/transactions/TX-8E68575864-12092022
```

#### Task to Process all Pending Transactions
/lib/tasks/run_transactions.rb
```
rake run_transactions:pending_transactions 
```

#### Testing
```
rails test
```
