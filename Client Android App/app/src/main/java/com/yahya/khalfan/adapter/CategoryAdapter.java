package com.yahya.khalfan.adapter;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.yahya.khalfan.R;
import com.yahya.khalfan.activity.ProductActivity;
import com.yahya.khalfan.api.clients.RestClient;
import com.yahya.khalfan.interfaces.CategorySelectCallBacks;
import com.yahya.khalfan.model.Category;
import com.squareup.picasso.Picasso;

import java.util.List;

public class CategoryAdapter extends RecyclerView.Adapter<CategoryAdapter.MyViewHolder> {

    List<Category> categoryList;
    Activity context;
    int selectedPosition = 0;
    CategorySelectCallBacks callBacks;

    public CategoryAdapter(List<Category> categoryList, Activity context, CategorySelectCallBacks callBacks ) {
        this.categoryList = categoryList;
        this.context = context;
        this.callBacks = callBacks;
    }



    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int i) {
        View itemView;

        itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.row_category, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull final MyViewHolder holder, int position) {

        final Category category = categoryList.get(position);
        holder.title.setText(category.getCategory());

        if(category.getCateimg()!=null){
            Picasso.get()
                    .load(RestClient.BASE_URL+ category.getCateimg())
                    .into(holder.imageView);
        }

        holder.ll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                selectedPosition = position;
                callBacks.onCategorySelect(position);
                notifyDataSetChanged();
            }
        });

        if(selectedPosition == position){
            holder.ll.setBackgroundColor(Color.parseColor("#FFFFFF"));
        }else{
            holder.ll.setBackgroundColor(Color.parseColor("#F2F2F2"));
        }
        holder.title.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(context, ProductActivity.class);
                intent.putExtra("category", "category");
                intent.putExtra("title", category.getCategory());
                intent.putExtra("category_id", category.getId());
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                context.startActivity(intent);
            }
        });

    }

    @Override
    public int getItemCount() {
        return categoryList.size();

    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        ImageView imageView;
        TextView title;
        LinearLayout ll;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);

            imageView = itemView.findViewById(R.id.category_image);
            title = itemView.findViewById(R.id.category_title);
            ll = itemView.findViewById(R.id.category_item_ll);
        }
    }
}
