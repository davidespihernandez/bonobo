from django.db import models


class DataOrigin(models.Model):
    conn_string = models.CharField(max_length=255)  # like postgresql://scott:tiger@localhost:5432/mydatabase
    name = models.CharField(max_length=255, unique=True)


class Customer(models.Model):
    data_origin = models.ForeignKey(DataOrigin, on_delete=models.CASCADE, related_name="customers")
    name = models.CharField(max_length=255)
    ext_id = models.IntegerField(db_index=True)

    class Meta:
        unique_together = [["data_origin", "name"]]


class Service(models.Model):
    data_origin = models.ForeignKey(DataOrigin, on_delete=models.CASCADE, related_name="services")
    name = models.CharField(max_length=255)
    ext_id = models.IntegerField(db_index=True)

    class Meta:
        unique_together = [["data_origin", "name"]]


class Record(models.Model):
    data_origin = models.ForeignKey(DataOrigin, on_delete=models.CASCADE, related_name="records")
    ext_id = models.IntegerField(db_index=True)
    date = models.DateTimeField()
    amount = models.DecimalField(max_digits=10, decimal_places=2)

