Lab Steps
Task 1: Sign in to GCP console
On The Google Sign in Page, Paste the Email ID And Click on Next. 
Enter The Password and Click on Next. 
Accept The Google Workspace Terms of Service by Clicking on the I Understand Button.
Accept The Google Cloud Terms of Service by Checking the Agreement and Clicking on Agree and Continue Button. 
From The Top Bar, click on the Dropdown to Select the Project. 
You Will See a Project Listed, Click on It. 
Note : If You Have Completed One Lab, Make Sure to Sign Out of the GCP Account Before Starting a New Lab. If You Face Any Issues, Please Go Through FAQs And Troubleshooting For Labs. 
Task 2: Creating a Cloud Storage Bucket
1. Click On The Hamburger Icon On The Top Left Corner  

2. Here You Will Find The List Of Common GCP Services, You Can Scroll Down And Click On More Products To See More Services.  



3. In The Left Sidebar, Click On Cloud Storage. 



4. Click On Create. 

5. Enter The Name For Your Bucket As whizlabs-gcs-lab And Click On Continue. 



6. Choose The Location Type As Region And Location As Us-Central1 And Click On Continue To Proceed Further. 



7. Choose Storage Class As Standard And Click On Continue. 



8. Keep The Other Options as Is. 

9. Click On Create To Finally Create Your Bucket. 

10. Create folder inside the bucket: 



11. Name you folder as final: 



12. Copy the path of folder for future use: 



Task 3: Creating a BigTable Instance
1. Click On the Hamburger Icon on the Top Left Corner  

2. Click On Bigtable Under the Databases Section. 



3. Click On Create Instance. 

4. Enter Instance Name Like whizlabs-bt-admin. 



5. It Will Automatically Generate an Instance I'd Like whizlabs-bt-admin, Please Make a Note of Instance Id, You Will Need This at a Later Stage in the Lab. 



6. Click On Continue. 

7. Select The Storage Type As HDD. 



8. Click On Continue. 

Task 4: Creating a BigTable Cluster
1. Enter the Cluster ID like whizlabs-cluster. 



2. Select The Region as Us-Central1 and Zone You Can Choose Any. 



3. Choose The Node Scaling Mode as Manual Allocation and Enter the Nodes As 1. 



4. Click On Create. 

5. You Can See Your Instance Listed. Click On Your Instance Id. 



6. You Will Be Able to See More Details About the Cluster. 



Task 5: Creating a Table of Bigtable
1. Start Cloud Shell from the Top Bar.  



2. Enter The Below Command and Replace <Project_id> With Your Project Id And <Instance_id> With the Chosen Instance. It Will Store the Variables for Project Id and Instance Id in a File Named Cbtrc. 

echo -e "project = <project_id>\ninstance = <instance_id>" > ~/.cbtrc
3. If It Prompts for Authorization, Click on Authorize  

4. Enter The Below Command to Create a Table. Replace <Table_name> with bt-table. If You Face Any -Creds Flag Related Error, You Can Ignore It. 

cbt createtable <table_name>
5. Enter The Below Command to Create a Column Family. Replace <Table_name> also execute commands below to insert the data. 

cbt createfamily <table_name> employee_name
cbt set bt-table r1 employee_name:c1=martha
 
cbt set bt-table r1 employee_name:c2=rachel
Task 6: Creating the Dataflow job
1. Click on the hamburger icon in the top left corner    

2. Scroll down and click on More products to see more services.  



3. Go to Dataflow under the Analytics section.



4. Click on Create job from template. 



5. Enter the Job name like whizlabs or any other name of your preference. Choose the Regional endpoint as us-central1(lowa). 



6. Click on the Dataflow template, and a drop-down menu will open type Cloud Bigtable to JSON. 



7. After Selection it should look like the following. 



8. Fill the other details according to the image and above steps, after filling all the details it should look like this: 



9. Exapnd Optional parameters and Click on browse to select Cloud Storage directory for storing JSON files and Click on Select:
                                                                        

10. Number of workers and Max Workers should be 1 and select service account from dropdown it should look like your username:
                                                                                        

11. Click on RUN JOB to execute the process: 



Validate the Lab:
Navigate Back to the Lab Document and Click on the Validation Button from the Right Sidebar. 
Click On Validate My Lab Button. 
                                                                    
You Will See the Successful Validation Result "Lab Tasks Completed". 
Completion and Conclusion: 
In this lab, you have successfully set up and executed a Dataflow job using the "Bigtable to JSON" template, demonstrating the capability to batch process and transfer data between Google Cloud services efficiently. 
This lab provided hands-on experience with configuring and running Dataflow jobs, as well as managing data in GCS and Bigtable, enhancing your practical understanding of these tools. 
Ensured proper cleanup of all resources to prevent unnecessary costs. 
End Lab: 
You have successfully completed the lab. 
Once you have completed the steps click on the End Lab button from your whizlabs dashboard.
