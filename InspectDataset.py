#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# In[2]:


customers = pd.read_csv("Dataset/olist_customers_dataset.csv") 
geolocation = pd.read_csv("Dataset/olist_geolocation_dataset.csv")
items = pd.read_csv("Dataset/olist_order_items_dataset.csv") 
order_payments = pd.read_csv("Dataset/olist_order_payments_dataset.csv")
orders = pd.read_csv("Dataset/olist_orders_dataset.csv")
order_reviews = pd.read_csv("Dataset/olist_order_reviews_dataset.csv")
products = pd.read_csv("Dataset/olist_products_dataset.csv")
sellers = pd.read_csv("Dataset/olist_sellers_dataset.csv")
category_name_translation = pd.read_csv("Dataset/product_category_name_translation.csv")


# In[3]:


customers.head(5)


# In[4]:


customers.count()


# In[5]:


customers.dtypes


# In[6]:


geolocation.head(5)


# In[7]:


geolocation.count()


# In[8]:


geolocation.dtypes


# In[9]:


items.head(5)


# In[10]:


items.count()


# In[11]:


items.dtypes


# In[12]:


order_payments.head(5)


# In[13]:


order_payments.count()


# In[14]:


order_payments.dtypes


# In[15]:


orders.head(5)


# In[16]:


orders.count()


# In[17]:


orders.dtypes


# In[18]:


order_reviews.head(5)


# In[19]:


order_reviews.count()


# In[20]:


order_reviews.dtypes


# In[21]:


products.head(5)


# In[22]:


products.count()


# In[23]:


products.dtypes


# In[24]:


sellers.head(5)


# In[25]:


sellers.count()


# In[26]:


sellers.dtypes


# In[27]:


category_name_translation.head(5)


# In[28]:


category_name_translation.count()


# In[29]:


category_name_translation.dtypes


# In[ ]:





# In[ ]:





# In[ ]:




