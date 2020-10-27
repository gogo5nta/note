#!/usr/bin/env python
# coding: utf-8

# In[1]:


import glob, os


# In[2]:


import random


# In[3]:


# put your own path here
dataset_path = 'dataset'


# In[4]:


# Percentage of images to be used for the validation set
percentage_test = 20


# In[5]:


get_ipython().system('mkdir data')
get_ipython().system('mkdir data/images')
get_ipython().system('mkdir data/labels')
get_ipython().system('mkdir data/images/train')
get_ipython().system('mkdir data/images/valid')
get_ipython().system('mkdir data/labels/train')
get_ipython().system('mkdir data/labels/valid')


# In[7]:


# Populate the folders
p = percentage_test/100
for pathAndFilename in glob.iglob(os.path.join(dataset_path, "*.jpg")):
    title, ext = os.path.splitext(os.path.basename(pathAndFilename))
    if random.random() <=p :
        os.system(f"cp {dataset_path}/{title}.jpg data/images/valid")
        os.system(f"cp {dataset_path}/{title}.txt data/labels/valid")
    else:
        os.system(f"cp {dataset_path}/{title}.jpg data/images/train")
        os.system(f"cp {dataset_path}/{title}.txt data/labels/train")

print("End")


# In[ ]:




